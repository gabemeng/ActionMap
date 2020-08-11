# frozen_string_literal: true

require 'google/apis/civicinfo_v2'

class RepresentativesController < ApplicationController
    def index
        @representatives = Representative.all
    end

    def show
        id = params[:id]
        @rep = Representative.find_by(id: id)
    end
end
