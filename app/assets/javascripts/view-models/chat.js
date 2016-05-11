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
        Arbiter.subscribe('new-message', self.pushNewMessage);
    };

    self.getData = function() {
        // $.getJSON('/api/v1/poker-room/' + roomID + '/messages/', onDataLoad);
        self.onDataLoad(self.funckingMockBecauseMihailIsSnail);
    };

    self.onDataLoad = function(data) {
        self.messages(data);
    };

    self.pushNewMessage = function(data) {
        self.messages.push(data);
        if (!self.opened()) {
            self.unreadMessages(self.unreadMessages() + 1);
        }
    };

    self.submitMessage = function() {
        $.post('/api/v1/messages/', { room_id: roomID, content: self.newMessageContent });
        self.newMessageContent('');
    };

    self.funckingMockBecauseMihailIsSnail = [
        {sended: '16-04-2014', user_name: 'mishoegei', content: 'bodur den'},
        {sended: '17-04-2014', user_name: 'mishoegei2', content: 'zdrasti'},
        {sended: '17-04-2014', user_name: 'mishoegei3', content: 'zdraveite'},
    ];

    self.init();
};
