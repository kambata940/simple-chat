App.chat_room = App.cable.subscriptions.create("ChatRoomChannel", {
    connected: function () {
        console.log('Connected');
    },
    disconnected: function () {
        alert('Disconnected');
        // Called when the subscription has been terminated by the server
    },
    received: function (data) {
        Arbiter.publish('new-message', data)
    }
}
);
