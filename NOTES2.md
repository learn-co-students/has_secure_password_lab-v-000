<!-- Showing how Rails helper method #form_tag generates HTML <form>

<%= form_tag controller: 'sessions', action: 'create' do %>
  <%= label_tag :name, "Username:" %>
  <%= text_field_tag :name %><br><br>
  <%= label_tag :password, "Password:" %>
  <%= password_field_tag :password %><br><br>
  <%= submit_tag "log in" %>
<% end %>

<form action="/login" accept-charset="UTF-8" method="post">
  <input name="utf8" type="hidden" value="✓">
  <input type="hidden" name="authenticity_token" value="long string here==">
  <label for="name">Username:</label>
  <input type="text" name="name" id="name"><br><br>
  <label for="password">Password:</label>
  <input type="password" name="password" id="password"><br><br>
  <input type="submit" name="commit" value="log in">
</form>
