App.chat_room = App.cable.subscriptions.create("ChatRoomChannel",
  {
    connected: function () {
      alert('wait for connection');
    },
    disconnected:  function () {
      // Called when the subscription has been terminated by the server
    },
    received:  function (data) {
      message = document.createElement('div');
      message.className = 'chat-message clearfix';

      contentDiv = document.createElement('div');
      contentDiv.className = 'chat-message-content clearfix';

      span = document.createElement('span');
      span.className = 'chat-time';
      span.appendChild(document.createTextNode(data.sended));

      username = document.createElement('h5');
      username.appendChild(document.createTextNode(data.user_name));

      content = document.createElement('p');
      content.appendChild(document.createTextNode(data.content))

      contentDiv.appendChild(span);
      contentDiv.appendChild(username);
      contentDiv.appendChild(content);

      message.appendChild(contentDiv);

      $('.chat-history').append(message)
    }
  }
);
