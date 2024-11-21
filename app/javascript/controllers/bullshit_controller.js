import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["btn"];

  connect() {
    console.log(this.btnTarget);
    this.btnTarget.disabled = false;
  }
}
