Rails.application.config.assets.precompile += %w(*.svg *.eot *.woff *.ttf *.gif *.png *.ico)
Rails.application.config.assets.precompile << /\A(?!active_admin).*\.(js|css)\z/
Rails.application.config.assets.precompile += %w( vendor/modernizr.js )
