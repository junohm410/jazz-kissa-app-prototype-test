import { Controller } from "@hotwired/stimulus"
import autoComplete from "@tarekraafat/autocomplete.js";

// Connects to data-controller="auto-complete"
export default class extends Controller {
  connect() {
    console.log('Hello from auto_complete_controller.js');
    const autoCompleteJS = new autoComplete({
      placeHolder: "ジャズ喫茶を入力してください",
      data: {
        src: async (query) => {
          const res = await fetch(`/api/jazz_cafes?query=${query}`);
          const data = await res.json();
          return data.map((item) => {
            return item.name;
          })
        }
      },
      resultItem: {
        highlight: true
      },
      events: {
        input: {
          selection: (event) => {
            const selection = event.detail.selection.value;
            autoCompleteJS.input.value = selection;
          }
        }
      }
    })
  }
}
