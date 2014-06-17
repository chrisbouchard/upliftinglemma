function gSigninCallback(authResult) {
    if (!authResult.status.signed_in) {
        console.log('Sign-in state: ' + authResult.error);
    }
}

