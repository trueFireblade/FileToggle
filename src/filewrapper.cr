struct FileWrapper
  def initialize(@active : Bool, @name : String)
  end

  def to_s
    if @active
      return "[X] " + @name
    else
      return "[ ] " + @name
    end
  end

  def <=>(other : self) : Int32
    @name <=> other.@name
  end
end
