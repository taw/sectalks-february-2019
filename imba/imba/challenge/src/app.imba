tag Validator
  prop table
  prop pass

  def empty
    table:length === 0 && pass:length === 0

  def index
    table[0][0]

  def code
    table[0][1]

  def subpass
    pass.substr(0, index) + pass.substr(index+1)

  def subtable
    table.slice(1)

  def render
    <self>
      if empty
        <.correct>
          "Password correct"
      else if pass.charCodeAt(index) === code
        <Validator pass=subpass table=subtable>
      else
        <.error>
          "Password incorrect"

tag App
  def build
    @password = ''
    @table = [
      # paste table here
    ]

  def render
    <self>
      <div>
        <input[@password] placeholder="Enter password...">
      <div>
        <Validator pass=@password table=@table>

Imba.mount <App>
