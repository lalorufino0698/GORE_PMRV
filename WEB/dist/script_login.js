$(document).ready(function () {
    $("#do_login").click(function () {
        closeLoginInfo();
        $(this).parent().find('span').css("display", "none");
        $(this).parent().find('span').removeClass("i-save");
        $(this).parent().find('span').removeClass("i-warning");
        $(this).parent().find('span').removeClass("i-close");

        var proceed = true;
        $("#login_form input").each(function () {
            if (!$.trim($(this).val())) {
                $(this).parent().find('span').addClass("i-warning");
                $(this).parent().find('span').css("display", "block");
                proceed = false;
            }
        });

        if (proceed) //everything looks good! proceed...
        {
            $(this).parent().find('span').addClass("i-save");
            $(this).parent().find('span').css("display", "block");
        }
    });

    // Reset previously results and hide all messages on .keyup()
    $("#login_form input").keyup(function () {
        $(this).parent().find('span').css("display", "none");
    });

    // Event listener for opening the login info when clicking the button
    $(".b-form.i-more").click(function (event) {
        event.preventDefault(); // Prevent default action if it's a link
        openLoginInfo();
    });

    // Event listener for closing the modal when cl icking the close button (X)
    $(".close-modal").click(function () {
        closeLoginInfo();
    });
});

function openLoginInfo() {
    $('.b-form').css("opacity", "0.01");
    $('.box-form').css("left", "-37%");
    $('.box-info').css("right", "-80%");
}

function closeLoginInfo() {
    $('.b-form').css("opacity", "1");
    $('.box-form').css("left", "0px");
    $('.box-info').css("right", "-5px");
}

$(window).on('resize', function () {
    closeLoginInfo();
});
