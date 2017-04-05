document.addEventListener("DOMContentLoaded", function(){
	cloudinary.setCloudName('tutoria');
	cloudinary.applyUploadWidget(
		document.querySelector('.uploader'), 
		{
			upload_preset: 'profile_src',
			multiple: false,
			cropping: "server",
			cropping_aspect_ratio: "1",
			min_image_height: 200,
			min_image_width: 200,
			max_image_height: 300,
			max_image_width: 300,
			gravity: "custom",
			form: ".user-form",
			field_name: "user[profile_src]",
			button_class: "btn btn-default btn-sm upload-button",
			button_caption: "Upload",
			stylesheet: "http://cloudinary.com/widget/themes/minimal.css"
		}, 
		function(error, result) {
			if (error ) {
				if (error.message != "User closed widget") {
					console.error("Cloudinary upload error:", error.message)
				}
			} else {			
				console.log(result[0])
				$(".upload-preview").html($("<img/>", {
					src: result[0].secure_url
				}))
				$("#profile-public-id").val(result[0].public_id)
				$("#profile-src").val(result[0].secure_url)
			}
		});
})

