require 'spec_helper'

describe Paperclip::Storage::Foggy do
  let(:avatar) { User.create(avatar_file_name: 'boat.jpg').avatar }
  let(:asset_url) { 'http://demo.cloudimg.io/s/resize/300/sample.li/boat.jpg' }

  it "has a version number" do
    expect(Paperclip::Storage::Foggy::VERSION).not_to be nil
  end

  describe '#path' do
    before { allow(avatar).to receive(:short_expiring_url).with(:original).and_return(asset_url) }

    it { expect(File.exists?(avatar.path)).to be_truthy }
  end

  describe '#fog_path' do
    it { expect(avatar.fog_path).to eq 'users/avatars/2/original/boat.jpg' }
  end

  describe '#url' do
    before { allow(avatar).to receive(:short_expiring_url).with(:original).and_return(asset_url) }

    it { expect(avatar.url).to eq asset_url }
  end

  describe '#method_missing' do
    context 'delegates method missing calls to internal fog instance' do
      before { expect(avatar.instance_variable_get(:@fog)).to receive(:non_existing_method) }

      it { avatar.non_existing_method }
    end
  end
end
