// export const getTutors () => fetch('api/tutors').then(r => r.json())
// export const getStudents () => fetch('api/students').then(r => r.json())



export const fetchCurrentUser = () => ( 
	new Promise((res, rej) => {
		const success = r => {
			r = r || {};
			res(r);
		}
		const error = e => {
			if (e.status === 422) {			
				rej(e.responseJSON);
			} else {
				rej({server: ["Server Error"]})
			}
		}
		$.ajax({
			url: `api/session`,
			method: "GET",
			success,
			error
		})
	})
)

export const signup = params => {

	if (params.imageData) delete params.imageData;

	if (params.publicId) {
		params.image_attributes = { public_id: params.publicId };
		delete params.publicId;
	}
	
	return ( 
		$.ajax({
			url: 'api/users',
			method: 'post',
			data: { user: params },
		})
	);
};

export const editProfile = (type, params) => {
	return ( 
	new Promise((res, rej) => {
		const success = r => res(r);
		const error = e => {
			if (e.status === 422) {			
				rej(e.responseJSON);
			} else {
				rej({server: ["Server Error"]})
			}
		}
		$.ajax({
			url: `api/${type}/${params.id}`,
			method: "PATCH",
			data: { 
				user: params,
			},
			success,
			error
		})
	})
)
}

export const logout = () => (
	new Promise((res, rej) => {
		const success = r => { 
			res(r);
		};
		const error = e => {
			if (e.responseJSON) {
				rej(e.responseJSON);
			} else {
				rej({ server: ["Server Error"] });
			}
		};
		$.ajax({
			url: "/api/session",
			method: "DELETE",
			success, 
			error,
		});
	})
);

export const login = params => (
	new Promise((res, rej) => {
		const success = r => { 
			res(r);
		};
		const error = e => {
			rej(e.responseJSON);
		};

		$.ajax({
			url: "/api/session",
			method: "POST",
			data: { user: params },
			success, 
			error,
		});
	})
);


export const createClass = params => (
	new Promise((res, rej) => {
		const success = r => { 
			res(r);
		};
		const error = e => {
			rej(e.responseJSON);
		};

		$.ajax({
			url: "/api/klasses",
			method: "POST",
			data: { klass: params },
			success, 
			error,
		});
	})
)