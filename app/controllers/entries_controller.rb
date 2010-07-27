class EntriesController < ApplicationController
  def index
    @search = Sunspot.search(Entry) do
      keywords params[:q]
      [:type, :category, :region, :attack_on, :type_of_unit, :sigact, :affiliation, :d_color, :classification, :complex_attack].each do |f|
        if params[f]
          with(f, params[f])
        else
          facet f
        end
      end
      [:friendly_wia, :friendly_kia, :host_nation_wia, :host_nation_kia, :civilian_wia, :civilian_kia, :enemy_wia, :enemy_kia, :enemy_detained, :friendly_casualties, :host_nation_casualties, :civilian_casualties, :enemy_casualties].each do |f|
        if params[f]
          if params[f] == "0"
            with(f, 0)
          elsif params[f] == "1-5"
            with(f, 1..5)
          elsif params[f] == "> 5"
            with(f).greater_than(5)
          end
        else
          facet f do
            row '0' do
              with(f).equal_to(0)
            end
            row '1-5' do
              with(f, 1..5)
            end
            row '> 5' do
              with(f).greater_than(5)
            end
          end
        end
      end

      paginate :page => params[:page]
    end
  end
  
  def show
    @entry = Entry.find params[:id]
  end
end
