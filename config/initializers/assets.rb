# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( bootstrap.scss camera.scss bootstrap.min.scss error.messages.scss 
AdminLTE.min.scss blue.scss responsive.scss style.scss dataTables.bootstrap.scss changes.scss _all-skins.min.scss
jquery_ujs.js jQuery-2.1.4.min.js bootstrap.min.js icheck.min.js jquery.dataTables.min.js dataTables.bootstrap.min.js jquery.slimscroll.min.js 
fastclick.min.js app.min.js demo.js jquery.js jquery-migrate-1.1.1.js jquery.easing.1.3.js superfish.js jquery.mobilemenu.js 
jquery.cookie.js jquery.equalheights.js jquery.mobile.customized.min.js camera.js jquery.carouFredSel-6.2.0.js 
jquery.touchSwipe.min.js bootstrap.js )
