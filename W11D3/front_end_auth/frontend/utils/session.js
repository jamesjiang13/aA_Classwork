// for signing up a user
export const postUser = user => (
  $.ajax({
    url: '/api/users',
    method: 'post',
    data: {user}
  })
)

// for logging in a user
export const postSession = user =>(
  $.ajax({
    url: '/api/session',
    method: 'post',
    data: {user}
  })
)

// to delete a session
export const deleteSession = () => (
  $.ajax({
    url: '/api/session',
    method: 'delete'
  })
)