# frozen_string_literal: true

module OmniAuth
  module Strategies
    # OmniAuth strategy for Etsy
    class Etsy < OmniAuth::Strategies::OAuth2
      option :name, :etsy
      option :pkce, true
      option :callback_url

      option :setup, lambda { |env|
        strategy = env&.dig('omniauth.strategy')
        return unless strategy

        etsy_auth_params = strategy.session['etsy.omniauth_params'] ||
          strategy.session['omniauth.params'] ||
          strategy.request.params

        etsy_auth_params = etsy_auth_params&.with_indifferent_access

        strategy.options[:authorize_params] = etsy_auth_params
      }

      uid { URI.parse(options[:client_options][:site]).host }

      def setup_phase
        options.scope = preprocessed_scopes
        options.client_options.merge!(urls)
        super
      end

      def callback_url
        options[:callback_url] || full_host + script_name + callback_path
      end

      private

      def preprocessed_scopes
        Array(options.scope).join(' ')
      end

      def urls
        {
          site: 'https://api.etsy.com',
          token_url: 'https://api.etsy.com/v3/public/oauth/token',
          authorize_url: 'https://www.etsy.com/oauth/connect',
        }
      end
    end
  end
end
