class Staff::IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_issue, only: %i[show edit update destroy]
end
