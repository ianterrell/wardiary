class Entry < ActiveRecord::Base
  set_table_name 'war_diary'
  # set_primary_key 'ROWID'
  
  searchable do
    text :title, :summary
    time :date
    string :report_key
    string :type
    string :category
    string :tracking_number
    string :region
    string :attack_on
    string :reporting_unit
    string :unit_name
    string :type_of_unit
    string :mgrs
    string :originator_group
    string :updated_by_group
    string :ccir
    string :sigact
    string :affiliation
    string :d_color
    string :classification
    boolean :complex_attack
    integer :friendly_wia
    integer :friendly_kia
    integer :host_nation_wia
    integer :host_nation_kia
    integer :civilian_wia
    integer :civilian_kia
    integer :enemy_wia
    integer :enemy_kia
    integer :enemy_detained
    integer :friendly_casualties
    integer :host_nation_casualties
    integer :civilian_casualties
    integer :enemy_casualties
  end
  
  [:Title, :Summary, :Date, :ReportKey, :Type, :Category, :TrackingNumber, :Region, :AttackOn, :ReportingUnit, :UnitName, :TypeOfUnit, :MGRS, :OriginatorGroup, :UpdatedByGroup, :CCIR, :Sigact, :Affiliation, :DColor, :Classification].each do |method|
    class_eval <<-RUBY
      def #{method.to_s.underscore.downcase}
        self.#{method}
      end
    RUBY
  end
  
  [:FriendlyWIA, :FriendlyKIA, :HostNationWIA, :HostNationKIA, :CivilianWIA, :CivilianKIA, :EnemyWIA, :EnemyKIA, :EnemyDetained].each do |method|
    class_eval <<-RUBY
      def #{method.to_s.underscore.downcase}
        self.#{method}.to_i
      end
    RUBY
  end
  
  def type
    self.Type
  end
  
  def complex_attack
    self.ComplexAttack == "TRUE"
  end
  
  def friendly_casualties
    self.FriendlyWIA.to_i + self.FriendlyKIA.to_i
  end
  
  def host_nation_casualties
    self.HostNationWIA.to_i + self.HostNationKIA.to_i
  end
  
  def civilian_casualties
    self.CivilianWIA.to_i + self.CivilianKIA.to_i
  end
  
  def enemy_casualties
    self.EnemyWIA.to_i + self.EnemyKIA.to_i
  end
end