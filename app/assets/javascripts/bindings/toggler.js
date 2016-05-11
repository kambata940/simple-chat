ko.bindingHandlers.toggler = {
    init: function(element, valueAccessor, allBindings, viewModel, bindingContext) {
        var valueAccessor = valueAccessor();
        var $toBeToggled = $(valueAccessor.toBeToggled);
        var subscriber = valueAccessor.subscriber;

        if ($toBeToggled.is(':visible') != subscriber()) {
            $toBeToggled.slideToggle(300, 'swing');
            subscriber(!subscriber());
        }

        $(element).click(function() {
            subscriber(!$toBeToggled.is(':visible'));
            $toBeToggled.slideToggle(300, 'swing');
        });
    }
};