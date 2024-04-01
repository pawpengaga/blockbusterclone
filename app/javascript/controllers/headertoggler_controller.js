import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="header-toggler"
export default class extends Controller {
  static targets = ["text"]

  changeColor(event){
    console.log("Aqui solia existir un sueño...")
    //const element = event.target
    //element.classList.add('myactive')
  }

}
