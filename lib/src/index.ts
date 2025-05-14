import { type PartialDeep } from 'type-fest';
import { Configuration } from 'webpack';

type Options={
    webpackConfig: Configuration & {
      Version: string;
    }
}

type DefineConfigFn = (
  userConfig: PartialDeep<Options>
) => PartialDeep<Options>

export const defineConfig: DefineConfigFn = (
  userConfig: PartialDeep<Options>
) => {
  return {
    ...userConfig
  }
};
