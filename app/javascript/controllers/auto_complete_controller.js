import { Controller } from "@hotwired/stimulus"
import autoComplete from "@tarekraafat/autocomplete.js";

// Connects to data-controller="auto-complete"
export default class extends Controller {
  connect() {
    const jazzCafeComplete = new autoComplete({
      placeHolder: "ジャズ喫茶を入力してください",
      selector: "#jazzCafeComplete",
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
            jazzCafeComplete.input.value = selection;
          }
        }
      }
    })

    const recordComplete = new autoComplete({
      placeHolder: "レコード名を入力してください",
      selector: "#recordComplete",
      data: {
        src: async (query) => {
          const res = await fetch(`/api/records?query=${query}`);
          return await res.json();
        }
      },
      resultItem: {
        highlight: true
      },
      events: {
        input: {
          selection: (event) => {
            const selection = event.detail.selection.value;
            recordComplete.input.value = selection;
          }
        }
      }
    })
  }
}
