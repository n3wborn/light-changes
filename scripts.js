/*
 * Keep an eye on delete links
 *
 */

/* First, we must keep an eye on trashs */
const trashs = document.querySelectorAll('.dellinks');

/* To warn furious clickers */
for (trash of trashs) {
	trash.addEventListener('click', function(e) {
		e.preventDefault();
		Swal.fire({
		  title: 'Really want to delete?',
		  text: "You won't be able to revert this!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
			// if ok
		  if (result.value) {
		    Swal.fire(
		    	// I shall tell "ok, delete this" to PHP
		    	// right here
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		    )
		  }
		})
	})
}
