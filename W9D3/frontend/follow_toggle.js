class FollowToggle {
    constructor(el){
        this.$el = $(el);
        this.userId = el.data('user-id');
        this.followState = el.data('initial-follow-state');
        this.render();
    }

    render(){
        if (this.followState === 'unfollowed'){
            this.$el.text('Follow!');
        } else {
            this.$el.text('Unfollow!');
        }
    }

    handleClick(e){
        e.preventDefault();
        $(this.$el).on('click', e => {
            if (this.followState === 'unfollowed'){
                $.ajax({
                    method: 'POST',
                    url: '/users/' + this.userId + '/follow',
                    dataType: 'JSON'
                }).then(res => {
                    this.$el.data('initial-follow-state', 'followed');
                    this.render();
                })
            } else {
                $.ajax({
                    method: 'DELETE',
                    url: '/users/' + this.userId + '/follow',
                    dataType: 'JSON'
                }).then(res => {
                    this.$el.data('initial-follow-state', 'unfollowed');
                    this.render();
                })
            }
        });
    }
}

module.exports = FollowToggle;