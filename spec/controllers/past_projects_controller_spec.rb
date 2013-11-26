require 'spec_helper'

describe PastProjectsController do
  let :project do
    Factory :project
  end

  context "when showing all projects" do
    it "should contain expired projects" do
      project.end_time = Time.now - 1
      project.save
      get :index
      assigns[:projects].should include(project)
    end

    it "should contain ongoing projects" do
      project.end_time = Time.now + 1.day
      project.save
      get :index
      assigns[:projects].should_not include(project)
    end
  end
end
