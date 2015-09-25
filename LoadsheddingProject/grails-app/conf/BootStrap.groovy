import loadsheddingmap.Role
import loadsheddingmap.User
import loadsheddingmap.UserRole


class BootStrap {

    def init = { servletContext ->
        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = loadsheddingmap.Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

        def adminUser = User.findByUsername('admin') ?: new User(
                username: 'admin',
                password: 'admin',
                enabled: true).save(failOnError: true)

        def basicUser = User.findByUsername('guest') ?: new User(
                username: 'user',
                password: 'user',                          //pw encoded by security plugin
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            UserRole.create adminUser, adminRole
        }
        if (!basicUser.authorities.contains(userRole)) {
            UserRole.create basicUser, userRole
        }
    }
    def destroy = {
    }
}
