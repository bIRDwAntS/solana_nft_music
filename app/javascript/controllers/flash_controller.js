import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Set a timeout to automatically dismiss the message
    this.autoDismissTimeout = setTimeout(() => {
      this.dismiss()
    }, 5000) // 5 seconds
  }

  disconnect() {
    // Clean up the timeout if the message is removed before it triggers
    if (this.autoDismissTimeout) {
      clearTimeout(this.autoDismissTimeout)
    }
  }

  dismiss() {
    // Add a transition to smoothly fade out the message
    this.element.classList.add("opacity-0", "transition-opacity", "duration-300")
    
    // Remove the element from the DOM after the transition finishes
    setTimeout(() => {
      this.element.remove()
    }, 300)
  }
}