const msj = (tipo, msj, cabecera) =>{
	if (tipo == 'error'){
		toastr.error(msj, cabecera, {
			closeButton: true,
			positionClass: "toast-bottom-right",
			showDuration: 200,
		    hideDuration: 200,
			timeOut: 3000,
			showEasing: "swing",
			hideEasing: "swing",
			showMethod: "fadeIn",
			hideMethod: "fadeOut"
		});
	} else if (tipo == 'success'){
		toastr.warning(msj, cabecera, {
			closeButton: true,
			positionClass: "toast-bottom-right",
			showDuration: 200,
		    hideDuration: 200,
			timeOut: 3000,
			showEasing: "swing",
			hideEasing: "swing",
			showMethod: "fadeIn",
			hideMethod: "fadeOut"
		});
	} else{
		toastr.success(msj, cabecera, {timeOut: 3000});
	}
}