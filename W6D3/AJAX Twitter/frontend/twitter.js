const FollowToggle = require("./follow_toggle");

$( () => {
    const followBtns = $('.follow-toggle');

    followBtns.each(function(index, button) {
        new FollowToggle($(button));
    });
})
