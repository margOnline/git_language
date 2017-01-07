class ApiErrorResponse < ApiResponse
  def success?
    false
  end

  def failure?
    !success
  end
end