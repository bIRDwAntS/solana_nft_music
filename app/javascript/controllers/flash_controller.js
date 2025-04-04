import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Auto-dismiss flash messages after 5 seconds
    this.timeout = setTimeout(() => {
      this.dismiss()
    }, 5000)
  }
  
  disconnect() {
    // Clear timeout if element is removed from DOM
    if (this.timeout) {
      clearTimeout(this.timeout)
    }
  }
  
  dismiss() {
    // Fade out and remove the flash message
    this.element.classList.add('opacity-0', 'transition-opacity', 'duration-500')
    setTimeout(() => {
      this.element.remove()
    }, 500)
  }
}