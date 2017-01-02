import $ from 'jquery'

var Invitations = {

	init(form) {
		this.form = form;
		this.form.on('submit', (e) => {
			e.preventDefault(e)
			this.handleSubmit(e)
		})
	},

	handleSubmit(e) {
		const invite = {
			room: e.target.room.value,
			sender: e.target.sender.value,
			invitee: e.target.invitee.value
		}

		this.postInvite(invite)
	},

	postInvite(payload) {
		$.post({
			url: '/api/v1/invitations',
			data: {invitation: payload},
			dataType: 'json',
			success: (d) => {
				console.log(d)
			}
		})
	}
}

export default Invitations