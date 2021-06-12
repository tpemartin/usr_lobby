var $authorizeButton = $('#authorize_button');
var $signoutButton = $('#signout_button');
$authorizeButton.click(handleAuthClick);
$signoutButton.click(handleSignoutClick)

/**
 *  Sign in the user upon button click.
 */
function handleAuthClick(event) {
  gapi.auth2.getAuthInstance().signIn();
}

/**
 *  Sign out the user upon button click.
 */
function handleSignoutClick(event) {
  gapi.auth2.getAuthInstance().signOut();
}
