// login, logout, signup
// session: post, delete

export const signup = userForm => (
    $.ajax({
        url: '/api/users/',
        method: 'POST',
        data: { userForm }
    })
)

export const login = userForm => (
    $.ajax({
        url: '/api/sessions',
        method: 'POST',
        data: { userForm }
    })
)

export const logout = user => (
    $.ajax({
        url: `/api/sessions/${user.id}`,
        method: 'DELETE'
    })
)


