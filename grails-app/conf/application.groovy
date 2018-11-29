

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'practica12.web.grails.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'practica12.web.grails.UserRole'
grails.plugin.springsecurity.authority.className = 'practica12.web.grails.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['ROLE_ADMIN']],
	[pattern: '/index.gsp',      access: ['ROLE_ADMIN']],
    [pattern: '/index',          access: ['ROLE_USER']],
    [pattern: '/index.gsp',      access: ['ROLE_USER']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

grails.gorm.default.mapping = {
    autowire true
}

grails.plugin.springsecurity.logout.postOnly = false