class FollowToggle {
    constructor ($el) {
        this.$el = $el;
        this.userId = $el.data("user-id")
        this.followState = $el.data("initial-follow-state");
        this.render();
        this.handleClick();

        // Set event listener on this.$el, to handleClick
    }

    render() {
        if (!this.followState) {
            this.$el.append("Follow!");
        } else if (this.followState) {
            this.$el.append("Unfollow!");
        }
    }

    handleClick() {
        this.$el.on('click', e => {
            e.preventDefault();
            if (!this.followState) {
                return $.ajax({
                    method: "POST",
                    url: `/users/${this.userId}/follow`,
                    dataType: "JSON"
                })
                .then((res) => {
                    this.$el.html("Unfollow!");
                    this.render();
                });
            }else {
                return $.ajax({
                    method: "DELETE",
                    url: `/users/${this.userId}/follow`,
                    dataType: "JSON"
                })
                .then(() => {
                    this.$el.html("Follow!");
                    this.render();
                });
            }

        });
    }

}


module.exports = FollowToggle;