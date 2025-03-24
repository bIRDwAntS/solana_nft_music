require "rails_helper"

RSpec.describe FooterComponent, type: :component do
  it "renders basic footer structure" do
    render_inline(described_class.new)
    
    expect(page).to have_content("NFT Music Platform")
    expect(page).to have_content("Explorer")
    expect(page).to have_content("Infos")
  end
  
  it "shows current year in copyright" do
    render_inline(described_class.new)
    
    expect(page).to have_content("© #{Date.current.year}")
  end
end