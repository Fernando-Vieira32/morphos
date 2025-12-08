import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["text", "result", "mode", "description", "tool"]
  static values = { variations: Object }

  connect() {
    // initialize current tool/variation
    this.currentToolId = this.toolTarget ? this.toolTarget.value : null
  }

  updateTool(event) {
    const toolId = event.target.value
    this.currentToolId = toolId
    const variations = this.variationsValue || {}
    const list = variations[toolId] || []

    // repopulate mode select
    if (this.hasModeTarget) {
      this.modeTarget.innerHTML = ''
      list.forEach(v => {
        const opt = document.createElement('option')
        opt.value = v.id
        opt.dataset.pattern = v.pattern
        opt.textContent = v.label
        this.modeTarget.appendChild(opt)
      })
      // update description
      const first = list[0]
      this.descriptionTarget.textContent = first ? first.description || '' : ''
    }
  }

  updateMode(event) {
    const select = event.target
    const selected = select.options[select.selectedIndex]
    const desc = selected ? selected.dataset.description : null
    if (this.hasDescriptionTarget && selected) {
      // we may not set description on options, so retrieve from variationsValue
      const vid = selected.value
      const vars = this.variationsValue[this.currentToolId] || []
      const found = vars.find(v => String(v.id) === String(vid))
      this.descriptionTarget.textContent = found ? (found.description || '') : ''
    }
  }

  count() {
    const text = this.textTarget.value || ''
    // get selected variation
    let pattern = null
    if (this.hasModeTarget) {
      const sel = this.modeTarget
      const opt = sel.options[sel.selectedIndex]
      pattern = opt ? opt.dataset.pattern : null
    }

    let resultText = ''
    if (!pattern) {
      resultText = `Total de caracteres: ${text.length}`
    } else {
      try {
        const re = new RegExp(pattern, 'g')
        const matches = text.match(re) || []
        resultText = `Total de ocorrências: ${matches.length}`
      } catch (e) {
        resultText = `Erro no padrão RegExp: ${e.message}`
      }
    }

    this.resultTarget.textContent = resultText
  }
}
