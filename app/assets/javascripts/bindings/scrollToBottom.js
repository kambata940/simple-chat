ko.bindingHandlers.scrollToBottomOnChange = {
    update: function(element, valueAccessor, allBindings, viewModel, bindingContext) {
        ko.unwrap(valueAccessor());
        element.scrollTop = element.scrollHeight;
    }
};