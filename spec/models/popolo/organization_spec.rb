require 'rails_helper'

<<<<<<< HEAD
describe Popolo::Organization do

  it "should be able to save two siblings" do
    org1 = FactoryGirl.create(:organization)
    org2 = FactoryGirl.create(:organization)
    Popolo::Organization.all.size.should eq(2)
  end

  describe "date_formats" do
    subject { FactoryGirl.create(:organization) }

    it "should not allow specific century" do
      subject.founding_date = '20'
      subject.valid?.should == false
    end

    it "should not allow confusion with YYMMDD" do
      subject.founding_date = '200401'
      subject.valid?.should == false
    end

    it "should not allow specific month" do
      subject.founding_date = '2004-01'
      subject.valid?.should == false
    end

    it "should not allow a specific year" do
      subject.founding_date = '2004'
      subject.valid?.should == false
    end

    it "should reset value to avoid parse errors" do
      subject.founding_date = ''
      (subject.valid? and subject.founding_date.nil?).should == false
    end

    it "should allow 2011-12-30" do
      subject.founding_date = '2011-12-30'
      subject.valid?.should == true
=======
module Popolo
  RSpec.describe Organization do
    [:founding_date, :dissolution_date].each do |attribute|
      it_behaves_like 'a model with a date attribute', attribute
>>>>>>> 1ef5e55070f9f25a4c40b3c0deb0f978ff27372a
    end
  end

end
