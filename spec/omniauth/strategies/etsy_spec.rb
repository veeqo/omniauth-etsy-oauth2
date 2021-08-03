# frozen_string_literal: true

RSpec.describe OmniAuth::Strategies::Etsy do
  let(:options) { {} }

  subject { described_class.new(nil, options) }

  describe '#callback_url' do
    let(:callback_url) { 'https://api.com/auth/etsy/callback' }
    let(:options) { { callback_url: callback_url } }

    it 'uses options callback_url' do
      expect(subject.callback_url).to eq(callback_url)
    end
  end

  describe '#options' do
    before { subject.setup_phase }

    context 'when setup block passed' do
      let(:block) { proc { |_env| (@result ||= 0) && @result += 1 } }
      let(:options) { { setup: block } }

      it 'runs the setup block if passed one' do
        expect(block.call).to eq(2)
      end
    end

    context 'when scopes are not passed' do
      it 'uses empty string as scope' do
        expect(subject.options.scope).to eq('')
      end
    end

    context 'when scopes passed' do
      context 'as array' do
        let(:options) { { scope: ['address_r', 'email_r'] } }

        it 'concatenates passed scopes with space' do
          expect(subject.options.scope).to eq('address_r email_r')
        end
      end

      context 'as string' do
        let(:options) { { scope: 'scope as string' } }

        it 'keeps scopes the same' do
          expect(subject.options.scope).to eq('scope as string')
        end
      end
    end

    describe 'auth and token urls' do
      it 'has correct token url' do
        expect(subject.options.client_options.token_url).to eq('https://api.etsy.com/v3/public/oauth/token')
      end

      it 'has correct authorize url' do
        expect(subject.options.client_options.authorize_url).to eq('https://www.etsy.com/oauth/connect')
      end
    end
  end
end
