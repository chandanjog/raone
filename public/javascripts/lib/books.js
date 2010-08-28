function Book() {

    var posted_books_container = $('.posted_books tbody');
    var add_button = $('#post_book');

    function onSuccess(data, textStatus, xhr) {
        posted_books_container.append(data);
    }

    function onComplete(xhr, textStatus) {
        //                    alert("in complete");
    }

    function onError() {
        //alert("in error");
    }

    this.attachEvents = function() {
        onAddClick();
    };
    function onAddClick() {
        add_button.click(function() {
            $.ajax({
                url: "/books/add",
                type: "POST",
                data: $('form').serialize(),
                success: onSuccess,
                error:onError,
                complete: onComplete
            });
        });
    }
}
