function ChatViewModel(roomID, roomName) {

    var self = this;
    self.roomName = roomName;

    self.init = function() {
        self.opened = ko.observable(true);
        self.opened.subscribe(function(){ self.unreadMessages(0); });

        self.newMessageContent = ko.observable('');
        self.messages = ko.observableArray([]);
        self.unreadMessages = ko.observable(0);

        self.getData();
        setTimeout(function(){
            Arbiter.subscribe('new-message', self.pushNewMessage)
        }, 100);
    };


    self.getData = function() {
        $.getJSON('/api/v1/chat_rooms/' + roomID + '/messages', self.onDataLoad);
    };

    self.onDataLoad = function(data) {
        var formattedData = data.map(self.formatMessage);
        self.messages(data);
    };

    self.formatMessage = function(message) {
        message.created_at = moment(message.created_at).format('Do MMMM YYYY, H:mm:ss');
        return message;
    };

    self.pushNewMessage = function(data) {
        self.messages.push(self.formatMessage(data));
        if (!self.opened()) {
            self.unreadMessages(self.unreadMessages() + 1);
        }
    };

    self.submitMessage = function() {
        $.post('/api/v1/messages/', { room_id: roomID, content: self.newMessageContent });
        self.newMessageContent('');
    };

    self.init();
};
