import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar", "overlay"]

  connect() {
    this.closeOnOutsideClick = this.closeOnOutsideClick.bind(this)
  }

  toggle() {
    const sidebar = this.sidebarTarget
    const overlay = this.overlayTarget

    sidebar.classList.toggle("-translate-x-full")
    overlay.classList.toggle("hidden")
  }

  close() {
    const sidebar = this.sidebarTarget
    const overlay = this.overlayTarget

    sidebar.classList.add("-translate-x-full")
    overlay.classList.add("hidden")
  }

  closeOnOutsideClick(event) {
    if (event.target === this.overlayTarget) {
      this.close()
    }
  }
}
