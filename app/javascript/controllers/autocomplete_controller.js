import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['input', 'list', 'wrapper']

  connect() {
    console.log('Hello from autocomplete...')
  }

  load() {
    if (this.query.length > 1) {
      fetch(`${this.url}?q=${this.query}`)
        .then(response => response.json())
        .then(suggestions => {
          this.render(suggestions);
        });
    } else {
      this.wrapper.classList.remove('open');
      this.list.innerHTML = '';
    }
  }

  render(suggestions) {
    if (suggestions.length > 0) {
      this.list.innerHTML = suggestions.join('');
      this.wrapper.classList.add('open');
    }
  }

  get list() {
    return this.listTarget;
  }

  get wrapper() {
    return this.wrapperTarget;
  }

  get query() {
    return this.inputTarget.value;
  }

  get url() {
    return this.data.get('url');
  }
}
