module "conectividade" {
  source = "./conectividade"
}

module "aplicacao" {
  source             = "./aplicacao"
  private_subnet_ids = module.conectividade.private_subnet_ids
  public_subnet_ids  = module.conectividade.public_subnet_ids
  security_group_id  = module.seguranca.security_groups_ids
}

module "seguranca" {
  source = "./seguranca"
  vpc_id = module.conectividade.vpc_id
}