import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["text", "result"]

  count() {
    const text = this.textTarget.value
    const count = text.length
    this.resultTarget.textContent = `Total de caracteres: ${count}`
  }
}
