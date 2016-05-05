todo

  h3
    | { opts.title }

  ul
    li(each='{ items }')
      label(class='{ completed: done }')
        input(type='checkbox', checked='{ done }', onclick='{ parent.toggle }')
        | { title }

  form(onsubmit='{ add }')
    input(name='input', onkeyup='{ edit }')
    button(disabled='{ !text }')
      | Add # { items.length + 1 }

  style(type='scss', scoped).
    :scope {
      display: block;
      max-width: 400px;
      margin: 5% auto;
      padding: 1em;
      font-family: 'myriad pro', sans-serif;
      font-size: 20px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    form {
      background-color: #f0f0f0;
      border-radius: 4px;
      input {
        font-size: 85%;
        padding: .4em;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 4px;
      }
    }

    button {
      background-color: #1FADC5;
      border: 1px solid rgba(0,0,0,.2);
      font-size: 75%;
      color: #fff;
      padding: .4em 1.2em;
      border-radius: 2em;
      cursor: pointer;
      margin: 0 .23em;
      outline: none;
    }

    button[disabled] {
      background-color: #ddd;
      color: #aaa;
    }

    ul {
      padding: 0;
    }

    li {
      list-style-type: none;
      padding: .2em 0;
    }

    .completed {
      text-decoration: line-through;
      color: #ccc;
    }

    label {
      cursor: pointer;
    }


  script.
    this.disabled = true

    this.items = opts.items

    edit(e) {
      this.text = e.target.value
    }

    add(e) {
      if (this.text) {
        this.items.push({ title: this.text })
        this.text = this.input.value = ''
      }
    }

    toggle(e) {
      var item = e.item
      item.done = !item.done
      return true
    }
