class AlbumsController < ApplicationController
  # Require user authentication for all actions except index and show
  # This ensures only logged-in users can create/edit/delete albums
  before_action :authenticate_user!, except: [:index, :show]
  
  # Find the album record before show/edit/update/destroy actions
  # This DRYs up the code by setting @album once in a filter
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  
  # Security measure: ensure only the owner can modify their albums
  # Prevents unauthorized edits by checking user ownership before actions
  before_action :verify_owner, only: [:edit, :update, :destroy]

  # GET /albums
  # Lists all albums in reverse chronological order (newest first)
  def index
    @albums = Album.all.order(created_at: :desc)
  end

  # GET /albums/:id
  # Shows a single album and its tracks in track number order
  def show
    @tracks = @album.tracks.order(:track_number)
  end

  # GET /albums/new
  # Initialize a new album belonging to current user
  # Also loads all genres for the form selection
  def new
    @album = current_user.albums.build
    @genres = Genre.all
  end

  # POST /albums
  # Creates a new album with the submitted parameters
  # Supports both HTML and Turbo Stream responses for modern Rails UX
  def create
    # Build a new album associated with current user using sanitized params
    @album = current_user.albums.build(album_params)
    @genres = Genre.all

    # Handle different response formats for traditional and Turbo-enabled clients
    respond_to do |format|
      if @album.save
        # Regular browser: redirect to show page with flash message
        format.html { redirect_to album_path(@album), notice: "Album created successfully." }
        # Turbo Stream: update page without full reload, show flash message
        format.turbo_stream { flash.now[:notice] = "Album created successfully." }
      else
        # If validation fails, re-render the form with errors
        # The 422 status code indicates validation failure
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render :new, status: :unprocessable_entity }
      end
    end
  end

  # GET /albums/:id/edit
  # Loads the edit form with the album data
  # Loads all genres for the form selection
  def edit
    @genres = Genre.all
  end

  # PATCH/PUT /albums/:id
  # Updates an existing album with new parameters
  # Supports both HTML and Turbo Stream responses
  def update
    @genres = Genre.all
    
    respond_to do |format|
      # Attempt to update with sanitized params
      if @album.update(album_params)
        # On success: redirect or update in-place with Turbo
        format.html { redirect_to album_path(@album), notice: "Album updated successfully." }
        format.turbo_stream { flash.now[:notice] = "Album updated successfully." }
      else
        # On failure: re-render the form with errors
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/:id
  # Removes the album from the database
  # Supports both HTML and Turbo Stream responses
  def destroy
    @album.destroy
    
    respond_to do |format|
      # After deletion, redirect to the albums index
      format.html { redirect_to albums_path, notice: "Album deleted successfully." }
      format.turbo_stream { flash.now[:notice] = "Album deleted successfully." }
    end
  end

  private

  # CRUCIAL: Find the album by ID from the URL parameters
  # Called by before_action for show, edit, update, destroy
  def set_album
    @album = Album.find(params[:id])
    # Note: This will raise ActiveRecord::RecordNotFound if album doesn't exist
    # Rails will automatically render a 404 page in this case
  end

  # SECURITY: Verify the current user owns the album
  # This is a crucial security check to prevent unauthorized modifications
  def verify_owner
    unless @album.user == current_user
      # If user is not the owner, redirect with a warning message
      redirect_to albums_path, alert: "Seems like you are not authorized to update this album."
    end
  end

  # IMPORTANT: Strong parameters to prevent mass-assignment vulnerabilities
  # This sanitizes and whitelists only the permitted attributes from form input
  def album_params
    params.require(:album).permit(
      :title, 
      :description, 
      :release_date, 
      :cover_image,   # This will need Active Storage setup for file uploads
      :royalty_percentage,
      genre_ids: []   # Allows multiple genre selections (has_many relationship)
    )
    
    # NOTE: For file uploads (cover_image and audio files for tracks),
    # ensure you have Active Storage configured properly and the
    # multipart: true option set in your form component
  end
end