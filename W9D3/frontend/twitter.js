require FollowToggle = require('./follow_toggle');

$(document).ready(function(){
    let $buttons = $('.follow-toggle');
    $buttons.each((id, button) => {
        new FollowToggle(button);
    });
});