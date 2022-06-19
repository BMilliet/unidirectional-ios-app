protocol LoginAppUseCaseFactory {
    func makeLoginUseCase(password: String) -> LoginActionUseCase
}
