/**
 * 
 */
 function SignUpFail() {
	if(errorMessage !==""){
		
	const divEle = document.getElementsByClassName('mt-3');
	divEle.innerHTML = `<div class="alert alert-danger alert-dismissible">
	  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
	  <strong>Danger!</strong> This alert box could indicate a dangerous or potentially negative action.
	</div>`;

	}
}