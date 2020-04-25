// also y no () => {} here

// to sign up
export const signup = user => 
  $.ajax({
    url: '/api/user',
    method: 'POST',
    data: { user }
  })
// { user } -> { user: user }  -> { user: {un: abc, pw: def} }
// format is dictated by controller params whattttt
// controller is expecting in final format, same as postman key field

// to login
export const login = user => 
  $.ajax({
    url: '/api/session',
    method: 'POST',
    data: { user }
  })

// to log out
export const logout = () =>
  $.ajax({
    url: '/api/session',
    method: 'DELETE'
  })
