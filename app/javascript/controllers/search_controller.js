import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  connect() {
    console.log("search controller connected")
    this.timeout = null;
  }

  submit(event) {
    clearTimeout(this.timeout) 
    this.timeout = setTimeout(()=> {
      console.log("submitting search form")
      this.element.requestSubmit()
    }, 300)
  }
}
